# declaring the class Lunch
class Lunch(object):
    # constructor method
    def __init__(self, menu):
        self.menu = menu

    # menu_price method as stated in the Problem
    def menu_price(self):
        if self.menu == "menu 1":
            print("Price 12.00")
        elif self.menu == "menu 2":
            print("Price 13.40")
        else:
            print("Error in menu")


Paul = Lunch("menu 1")
Paul.menu_price()
