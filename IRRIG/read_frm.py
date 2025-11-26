
import sys

def read_lines(filepath, start, count):
    try:
        with open(filepath, 'r', encoding='latin1') as f:
            lines = f.readlines()
            print(f"Total lines: {len(lines)}")
            for i in range(start, min(start + count, len(lines))):
                print(f"{i+1}:{lines[i].rstrip()}")
    except Exception as e:
        print(f"Error: {e}")

def search_term(filepath, term):
    try:
        with open(filepath, 'r', encoding='latin1') as f:
            for i, line in enumerate(f):
                if term.lower() in line.lower():
                    print(f"{i+1}:{line.strip()}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    action = sys.argv[1]
    filepath = sys.argv[2]
    
    if action == "read":
        start = int(sys.argv[3]) - 1
        count = int(sys.argv[4])
        read_lines(filepath, start, count)
    elif action == "search":
        term = sys.argv[3]
        search_term(filepath, term)
