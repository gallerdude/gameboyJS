class Register
{
  int value;

  Register()
  {
    this.value = 0;
  }

  void set(int i)
  {
    this.value = i & 0xFF;
  }

  int get()
  {
    return this.value;
  }

  int toInt()
  {
    return this.value;
  }

  int operator +(int other) => ((value+other)&0xFF);
}
