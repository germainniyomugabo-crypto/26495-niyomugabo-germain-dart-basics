
 // Student: Niyomugabo Germain
 // Reg no: 26495
 const String regNo = '26495';
 final int d = int.parse(regNo[regNo.length - 1]);
 final int t = int.parse(regNo.substring(regNo.length - 2));

 // B2: Count vowels
 int countVowels(String text) {
// by GN
   int count = 0;
   String name = text.toLowerCase();

   for (int i = 0; i < name.length; i++) {
     if ('aeiou'.contains(name[i])) {
       count++;
     }
   }

   return count;
 }

 // B3: Generate initials

 String initials(String fullName) {

   String cleanedName = fullName.trim();

   if (cleanedName.isEmpty) {
     return '';
   }

   List<String> names = cleanedName.split(RegExp(r'\s+'));

   String result = '';

   for (String name in names) {
     result += '${name[0].toUpperCase()}.';
   }

   return result;
 }

 // C5: Draw a triangle

 void drawTriangle(int height) {
  
   if (height <= 0) {
     return;
   }

   for (int row = 1; row <= height; row++) {
     String line = '';

     for (int space = 0; space < height - row; space++) {
       line += ' ';
     }

     String symbol = row.isEven ? '#' : '*';

     for (int i = 0; i < row; i++) {
       line += symbol;
     }

     print(line);
   }
 }

 void main() {


   // B2
   String fullName = 'Niyomugabo Germain';
   print('$fullName has ${countVowels(fullName)} vowels');

   // B3
   print(initials(fullName));
   print(initials(' ana uwase '));
   print(initials(' '));

   // C5
   drawTriangle(d + 3);
   drawTriangle(0);
   drawTriangle(-2);

   // D2

  // D2: MoMo receipt printer
  int totalFees = 0;
  int i = 1;
  String phone = maskPhone('0788123456');

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    print('Receipt $i | $amount RWF | fee $fee RWF | to $phone');

    totalFees += fee;
    i++;
  }

  print('Total fees: $totalFees RWF');

 }


int momoFee(int amount) {

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

String maskPhone(String phone) {

  if (phone.length != 10) {
    return 'INVALID';
  }

  String result = phone.substring(0, 3);
  int i = 3;

  while (i < phone.length - 2) {
    result += '*';
    i++;
  }

  result += phone.substring(phone.length - 2);

  return result;
}


