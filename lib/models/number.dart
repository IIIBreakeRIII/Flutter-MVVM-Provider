// Define Model
// Number class has variable calls "_num" and will change its value if increment of decrement function is worked.

// "get" keyword is same as getter and setter.
// "get" keyword is get the value of member variable, and "set" keyword is writing the value.
// Below in this class, variable call "_num" is private member variable.
// And because of these reasons, we cannot access to "_num" directly.
// So, we can use getter method - which is public method - to access to "num"
// First, we access to num by "get" method, and we can get the value of num.
// Then, we give num to _num, which is private variable, and finally we can change the value.

class Number {
  int _num = 0;
  int get num => _num;

  void increment() {
    _num++;
  }
  void decrement() {
    _num--;
  }
}