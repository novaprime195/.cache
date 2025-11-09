#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* next;
} Node;

Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

void insertAtBeginning(Node** head, int data) {
    Node* newNode = createNode(data);
    newNode->next = *head;
    *head = newNode;
}

void insertAtEnd(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
        return;
    }
    Node* temp = *head;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    temp->next = newNode;
}

void deleteNode(Node** head, int key) {
    Node* temp = *head;
    Node* prev = NULL;
    
    if (temp != NULL && temp->data == key) {
        *head = temp->next;
        free(temp);
        return;
    }
    
    while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->next;
    }
    
    if (temp == NULL) return;
    
    prev->next = temp->next;
    free(temp);
}

void displayList(Node* head) {
    if (head == NULL) {
        printf("List is empty\n");
        return;
    }
    Node* temp = head;
    printf("Linked List: ");
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

void freeList(Node** head) {
    Node* temp;
    while (*head != NULL) {
        temp = *head;
        *head = (*head)->next;
        free(temp);
    }
}

int main() {
    Node* head = NULL;
    
    printf("=== Singly Linked List Demo ===\n\n");
    
    insertAtEnd(&head, 10);
    insertAtEnd(&head, 20);
    insertAtEnd(&head, 30);
    displayList(head);
    
    insertAtBeginning(&head, 5);
    printf("\nAfter inserting 5 at beginning:\n");
    displayList(head);
    
    insertAtEnd(&head, 40);
    printf("\nAfter inserting 40 at end:\n");
    displayList(head);
    
    deleteNode(&head, 20);
    printf("\nAfter deleting 20:\n");
    displayList(head);
    

    freeList(&head);
    printf("\nMemory freed successfully!\n");
    
    return 0;
}
