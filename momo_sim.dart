// Student: Mark Daniel Kollie
// Reg no: 27500
const String regNo = '27500';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ---------------- copied from D2 ----------------
int momoFee(int amount) {
  // by MDK
  if (amount <= 0) return -1; // invalid
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// ---------------- F1 ----------------
String formatRwf(int amount) {
  // by MDK
  bool negative = amount < 0;
  String digits = (negative ? -amount : amount).toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    // after every 3 digits (counting from the right) put a comma
    if (count > 0 && count % 3 == 0) {
      result = ',' + result;
    }
    result = digits[i] + result;
    count++;
    i--;
  }
  String sign = negative ? '-' : '';
  return '$sign$result RWF';
}

// ---------------- F2 ----------------
bool isValidPin(String pin) {
  // by MDK
  if (pin.length != 5) return false;
  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false; // not '0'..'9'
    i++;
  }
  if (pin == '12345') return false;
  if (pin == pin[0] * 5) return false; // same digit five times
  return true;
}

// ---------------- F3 ----------------
int sendMoney(int balance, int amount) {
  // by MDK
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// ---------------- F4 ----------------
int buyAirtime(int balance, int amount) {
  // by MDK
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be from 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Airtime bought: ${formatRwf(amount)}. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by MDK
  print('Reg no: $regNo | D = $d | T = $t');
  print('');

  // 1. PIN checks
  print("12345: ${isValidPin('12345')}");
  print("77777: ${isValidPin('77777')}");
  print("4821: ${isValidPin('4821')}");
  print("48a21: ${isValidPin('48a21')}");
  print("4821$d: ${isValidPin('4821$d')}");
  print('');

  // 2. Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Transactions, in order
  int k = 0;
  while (k < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    k++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');
  print('');

  // 5. My own tests (expected output in the comment)
  print(formatRwf(100000)); // expected: 100,000 RWF
  print(formatRwf(12)); // expected: 12 RWF
  print(formatRwf(-1250)); // expected: -1,250 RWF
  print(formatRwf(-999)); // expected: -999 RWF  <- might break: a naive version gives "-,999"
  print(isValidPin('00000')); // expected: false (same digit five times)
  print(isValidPin('01234')); // expected: true  <- might break: leading zero, a PIN is text not a number
  print(isValidPin('')); // expected: false (empty string, length check must come before pin[0])
}
