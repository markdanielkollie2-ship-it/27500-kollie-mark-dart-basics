// Student: Mark Daniel Kollie
// Reg no: 27500
const String regNo = '27500';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ---------------- B2 ----------------
int countVowels(String text) {
  // by MDK
  int count = 0;
  String lower = text.toLowerCase(); // makes capital vowels count too
  for (final ch in lower.split('')) {
    if ('aeiou'.contains(ch)) {
      count++;
    }
  }
  return count;
}

// ---------------- B3 ----------------
String initials(String fullName) {
  // by MDK
  String result = '';
  // trim() removes outer spaces; the regex splits on one OR MORE spaces
  List<String> words = fullName.trim().split(RegExp(r'\s+'));
  int i = 0;
  while (i < words.length) {
    if (words[i].isNotEmpty) {
      result += words[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

// ---------------- C5 ----------------
void drawTriangle(int height) {
  // by MDK
  int row = 1;
  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    // spaces on this row = height - row, then `row` symbols
    print(' ' * (height - row) + symbol * row);
    row++;
  }
}

// ---------------- D2 ----------------
int momoFee(int amount) {
  // by MDK
  if (amount <= 0) return -1; // invalid
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by MDK
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) +
      '*' * (phone.length - 5) +
      phone.substring(phone.length - 2);
}

void main() {
  // by MDK
  print('Reg no: $regNo | D = $d | T = $t');
  print('');

  // ----- B2 -----
  String fullName = 'Mark Daniel Kollie';
  print('$fullName has ${countVowels(fullName)} vowels');
  print('');

  // ----- B3 -----
  print("'${initials(fullName)}'");
  print("'${initials(' ana uwase ')}'");
  print("'${initials(' ')}'");
  print('');

  // ----- C5 -----
  print('Triangle, height ${d + 3}:');
  drawTriangle(d + 3);
  print('Triangle, height 0 (nothing below):');
  drawTriangle(0);
  print('Triangle, height -2 (nothing below):');
  drawTriangle(-2);
  print('');

  // ----- D2 -----
  const String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
