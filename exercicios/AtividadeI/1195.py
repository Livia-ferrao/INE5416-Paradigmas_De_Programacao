class Node:
    def __init__(self, val):
        self.value = val
        self.left = None
        self.right = None
                
class Tree:
    def __init__(self):
        self.root = None

    def search(self, pivot, k):
        if k == pivot.value:
            return pivot
        else:
            if k <= pivot.value:
                if pivot.left is not None:
                    return self.search(pivot.left, k)
            else:
                if pivot.right is not None:
                    return self.search(pivot.right, k)
        return pivot

    def insert(self, val):
        new_node = Node(val)    
        if self.root is None:
            self.root = new_node
        else:
            # Assumindo que não tem elementos repetidos:
            pivot = self.search(self.root, val)
            if val <= pivot.value:
                pivot.left = new_node 
            else:
                pivot.right = new_node


    def inorder(self, pivot):
        if (pivot is not None):
            self.inorder(pivot.left)
            print(pivot.value, end =" ")
            self.inorder(pivot.right)

    def preorder(self, pivot):
        if (pivot is not None):
            print(pivot.value, end =" ")
            self.preorder(pivot.left)
            self.preorder(pivot.right)

    def posorder(self, pivot):
        if (pivot is not None):
            self.posorder(pivot.left)
            self.posorder(pivot.right)
            print(pivot.value, end =" ")

n = int(input())
for i in range(n):
    qntd = int(input())
    vetor = list(map(int, input().split()))
    
    tree = Tree()
    for i in vetor:
        tree.insert(i)


    print("Pre.: ", end = "")
    tree.preorder(tree.root)
    print()
    print("In..: ", end = "")
    tree.inorder(tree.root)
    print()
    print("Post: ", end = "")
    tree.posorder(tree.root)
    print()
    print()