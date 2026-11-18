
 // Student: Niyomugabo Germain
// Reg no: 26495
const String regNo = '26495';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// D2: MoMo fee function
int momoFee(int amount) {
  // by GN
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// F1: Format money with commas
String formatRwf(int amount) {
  // by GN
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;

  while (digits.isNotEmpty) {
    result = digits.substring(digits.length - 1) + result;
    digits = digits.substring(0, digits.length - 1);
    count++;

    if (count % 3 == 0 && digits.isNotEmpty) {
      result = ',' + result;
    }
  }

  if (negative) {
    result = '-' + result;
  }

  return '$result RWF';
}

// F2: Check PIN
bool isValidPin(String pin) {
  // by GN
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  while (i < pin.length) {
    if (!'0123456789'.contains(pin[i])) {
      return false;
    }
    i++;
  }

  bool sameDigit = true;
  i = 1;

  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      sameDigit = false;
    }
    i++;
  }

  if (sameDigit) {
    return false;
  }

  return true;
}

// F3: Send money
int sendMoney(int balance, int amount) {
  // by GN
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

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// F4: Buy airtime
int buyAirtime(int balance, int amount) {
  // by GN
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Bought airtime ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Main program
void main() {
  // by GN
  print('Reg no: $regNo | D = $d | T = $t');

  // F: Test PINs
  print("PIN 12345: ${isValidPin('12345')}");
  print("PIN 4821D: ${isValidPin('48215')}");
  print("PIN 77777: ${isValidPin('77777')}");
  print("PIN 4821: ${isValidPin('4821')}");
  print("PIN 48a21: ${isValidPin('48a21')}");

  // Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // Send money three times
  int amount = (d + 1) * 3000;

  int i = 1;
  while (i <= 3) {
    balance = sendMoney(balance, amount);
    i++;
  }

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Test invalid and insufficient transactions
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // Final balance
  print('Final balance: ${formatRwf(balance)}');

  // Extra tests for formatRwf
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF

  // Extra tests for isValidPin
  print(isValidPin('00000')); // Expected: false
  print(isValidPin('48215')); // Expected: true
  print(isValidPin('12a45')); // Expected: false
}

