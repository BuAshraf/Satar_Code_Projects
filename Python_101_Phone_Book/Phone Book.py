phone_book = {
    'Amal': '1111111111',
    'Mohammed': '2222222222',
    'Khadijah': '3333333333',
    'Abdullah': '4444444444',
    'Rawan': '5555555555',
    'Faisal': '6666666666',
    'Layla' : '7777777777',
}

def search_by_number(number):
    """Search for a name by phone number"""
    if number.isdigit() and len(number) == 10:
        for name, phone in phone_book.items():
            if phone == number:
                return name
        return "Sorry, the number is not found"
    else:
        return "This is an invalid number"

def search_by_name(name):
    """Search for a number by name"""
    if name in phone_book:
        return f"The number of {name} is {phone_book[name]}"
    else:
        return "Sorry, the name is not found"

def add_contact(name, number):
    """Add a new contact to the phone book"""
    if number.isdigit() and len(number) == 10:
        phone_book[name] = number
        return "Contact added successfully"
    else:
        return "Invalid number. Contact not added"

# Main program loop
while True:
    print("\nPhone Book Menu:")
    print("1. Search by Number")
    print("2. Search by Name")
    print("3. Add Contact")
    print("4. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        number = input("Enter the number: ")
        print(search_by_number(number))
    elif choice == '2':
        name = input("Enter the name: ")
        print(search_by_name(name))
    elif choice == '3':
        name = input("Enter the name: ")
        number = input("Enter the number: ")
        print(add_contact(name, number))
    elif choice == '4':
        print("Exiting program...")
        break
    else:
        print("Invalid choice. Please enter a number between 1 and 4.")
