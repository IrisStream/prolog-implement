import argparse
from os import curdir, stat
import sys, copy, re, getopt

facts = {}
rules = {}
special_term = {}

class Term:
    def __init__ (self, s) :   # expect "x(y,z...)"
        s = s.lstrip()
        s = s.rstrip()
        if s[-1] != ')': 
            print("Syntax error in term: %s" % [s])
        flds = s.split('(', 1)
        if len(flds) != 2: 
            print("Syntax error in term: %s" % [s])
        self.pred = flds[0]
        if(self.pred == 'not'):
            self.args = [flds[1][:-1].lstrip()]
            self.args[0] = self.args[0].rstrip()
        else:
            self.args = flds[1][:-1].split(',')
            for i in range(len(self.args)):
                self.args[i] = self.args[i].lstrip()
                self.args[i] = self.args[i].rstrip()

    def __repr__ (self) :
        return "%s(%s)" % (self.pred,",".join(self.args))

    def type(self):
        return "Term"

def diff(term, subst):
    return (subst[term.args[0]] != subst[term.args[1]])

def equal(term, subst):
    return (subst[term.args[0]] == subst[term.args[1]])

def greater(term, subst):
    return (float(subst[term.args[0]]) > float(subst[term.args[1]]))

def less(term, subst):
    return (float(subst[term.args[0]]) < float(subst[term.args[1]]))

def greater_equal(term, subst):
    return (float(subst[term.args[0]]) >= float(subst[term.args[1]]))

def less_equal(term, subst):
    return (float(subst[term.args[0]]) <= float(subst[term.args[1]]))

special_term = {
    'diff' : diff,
    'equal' : equal,
    'greater' : greater,
    'less' : less,
    'greater_equal' : greater_equal,
    'less_equal' : less_equal
}

class Rule:
    def __init__ (self, s):   # expect "term-:term;term;..."
        flds = s.split(":-")
        self.lhs = Term(flds[0])
        self.rhs = []
        if len(flds) == 2:
            flds = re.sub("\),",");",flds[1]).split(";")
            for i in range(len(flds)):
                flds[i] = flds[i].lstrip()
                flds[i] = flds[i].rstrip()
                self.rhs.append(Term(flds[i]))

    def __repr__ (self):
        rep = str(self.lhs)
        sep = " :- "
        for term in self.rhs:
            rep += sep + str(term)
            sep = ","
        return rep

    def type(self):
        return "Rule"
        
class Goal:
    def __init__ (self, clause, type = True, parent = None, subst={}):
        self.clause = clause
        self.type = type
        self.parent = parent
        self.subst = copy.deepcopy(subst)
        self.index = 0


    def __repr__ (self) :
        return "clause=%s index=%d subst=%s" % (self.clause, self.index, self.subst)
    

def procFile(f, prompt, output = sys.stdout):
    while 1:
        statement = f.readline()
        if statement == "": 
            break

        # Comment detect
        if statement.find('/*') >= 0:
            while statement.find('*/') < 0:
                statement = f.readline()
            continue
        statement = re.sub("#.*","",statement[:-1])   

        statement = re.sub("  ", " ",statement)         
        statement = statement.rstrip()
        if(prompt == 'Query' and output != sys.stdout):
            statement = statement[2:]                       #remove '?-'
        if statement == "" or statement == ' ': 
            continue

        clause = statement
        if statement[-1]  == '.':
            clause = clause[:-1]

        if clause == 'quit':
            sys.exit(0)
        elif prompt == 'Query':
            output.write('\t?-'+statement+'\n')
            search(Term(clause), output)
        elif prompt == 'KB':
            new_rule = Rule(clause)
            if len(new_rule.rhs) == 0:
                new_fact = new_rule.lhs
                if new_fact.pred not in facts:
                    facts[new_fact.pred] = [new_fact]
                else:
                    facts[new_fact.pred].append(new_fact)
            else:
                if new_rule.lhs.pred not in rules:
                    rules[new_rule.lhs.pred] = [1, new_rule]
                else:
                    rules[new_rule.lhs.pred].append(new_rule)

# A Goal is a rule in at a certain point in its computation. 
# env contains definitions (so far), index indexes the current term
# being satisfied, parent is another Goal which spawned this one
# and which we will unify back to when this Goal is complete.
#

def unify(src_term, src_subst, dest_term, dest_subst):
    "update dest env from src. return true if unification succeeds"
    nargs = len(src_term.args)
    if nargs != len(dest_term.args):
        return 0
    if src_term.pred != dest_term.pred:
        return 0
    for i in range(nargs):
        src_arg  = src_term.args[i]
        dest_arg = dest_term.args[i]
        if src_arg[0] >= 'A' and src_arg[0] <= 'Z':
            src_val = src_subst.get(src_arg)
        else:
            src_val = src_arg
        if not src_val:    #src_val is a variable
            continue
        if dest_arg[0] >= 'A' and dest_arg[0] <= 'Z':  # Variable in destination
            dest_val = dest_subst.get(dest_arg)
            if not dest_val:
                dest_subst[dest_arg] = src_val  # Unify !
            elif dest_val != src_val:
                return 0           # Won't unify
        elif dest_arg != src_val:
            return 0           # Won't unify
    # check for special term
    if src_term.pred in special_term and len(dest_subst) == 2:
        for predi in special_term:
            if src_term.pred == predi and not special_term[predi](dest_term, dest_subst):
                return 0
    return 1

def search(term, output):
    goal = Goal(Rule("final_goal(goal):-deptrai(son)"))      # Anything- just get a rule object
    goal.clause.rhs = [term]                  # target is the single goal
    stack = [goal]                            # Start our search
    is_true = False
    while len(stack) > 0:
        cur_goal = stack.pop()        # Next goal to consider
        clause_type = cur_goal.clause.type()
        if clause_type == 'Term' or (clause_type == 'Rule' and cur_goal.index >= len(cur_goal.clause.rhs)):   # Is this one finished?
            if cur_goal.parent == None:                         # Yes. Our original goal?
                is_true = True
                if cur_goal.subst: 
                    output.write(str(cur_goal.subst) + '\n')
                else: 
                    output.write('Yes\n')
                    return
                continue
            parent = copy.deepcopy(cur_goal.parent)  # Otherwise resume parent goal
            if(parent.type == False):
                if rules[parent.clause.lhs.pred][0] < len(rules[parent.clause.lhs.pred]):
                    continue
                if(parent.clause.lhs.pred != 'final_goal'):
                    rules[parent.clause.lhs.pred][0] = 1
            if(clause_type == 'Term'):
                unify(cur_goal.clause, cur_goal.subst, parent.clause.rhs[parent.index],parent.subst)
            else:
                unify(cur_goal.clause.lhs, cur_goal.subst, parent.clause.rhs[parent.index],parent.subst)
            parent.index += 1         # advance to next goal in body
            stack.append(parent)              # let it wait its turn
            continue

        # No. more to do with this goal.
        term = cur_goal.clause.rhs[cur_goal.index]            # What we want to solve
        child_type = True        #Positive or negative
        if(term.pred == 'not'):
            term = Term(term.args[0])
            child_type = False
        child_type = not(child_type ^ cur_goal.type)
        if(term.pred in facts):
            existed = False
            for fact in facts[term.pred]:
                child = Goal(fact, child_type, cur_goal)
                if unify(term, cur_goal.subst, child.clause, child.subst):
                    existed = True
                    if(child_type):
                        stack.append(child)
            if (not existed) and (child_type == False):
                rules[cur_goal.clause.lhs.pred][0] += 1
                stack.append(Goal(term, child_type, cur_goal, cur_goal.subst))
            if existed and not child_type:
                rules[cur_goal.clause.lhs.pred][0] = 1
                while stack and stack[-1].clause.type() == 'Rule' and stack[-1].clause.lhs.pred == cur_goal.clause.lhs.pred:
                    stack.pop()
        elif term.pred in rules:
            for i in range(1,len(rules[term.pred])):        # Walk down the rule database
                rule = rules[term.pred][i]
                if len(rule.lhs.args) != len(term.args): 
                    continue
                child = Goal(rule, child_type, cur_goal)               # A possible subgoal
                if unify(term, cur_goal.subst, rule.lhs, child.subst):
                    stack.append(child)
    if is_true:
        output.write('Yes\n')
    else:
        output.write('No\n')

def arg_parser():
    CLI = argparse.ArgumentParser()
    CLI.add_argument(
        "-i",
        "--input",
        nargs="*"
    )
    CLI.add_argument(
        "-q",
        "--query",
        nargs="*"
    )
    CLI.add_argument(
        "-o",
        "--output"
    )
    args = CLI.parse_args()
    return args.input, args.query, args.output

if __name__ == "__main__": 
    inputfile, queryfile, outputfile = arg_parser()
    inputfile.append('input.pl')
    output = open(outputfile,'w')
    for file in inputfile:
        procFile(open(file),'KB')      # file on the command line
    for file in queryfile:
        procFile(open(file),'Query', output)         # let the user have her say
    output.close()