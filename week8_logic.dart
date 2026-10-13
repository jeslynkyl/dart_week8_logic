double calculateTotal (int quantity, double unitPrice){
  if (quantity <=0){
  throw ArgumentError ('Quantity must be at least 1.');
  }
  
  double subtotal=0;
  for (int i=1; i<=quantity; i++){
  subtotal+=unitPrice;
  }
  
  double discRate;
  if (subtotal>=500){
    discRate=0.20;
  } else{
    discRate=0.0;
  }
  return subtotal - (subtotal*discRate);
}


void main() {
  double unitPrice=49.50;
  
  List<String> orders=['3','10','0','abc','12'];
  
  print('=== Store Order Checker ===');
  
  for (int i=0;i<orders.length; i++){
    String input=orders[i];
    print('Order ${i+1}: Quantity "$input"');
    
    try{
      int quantity=int.parse(input);
      double total=calculateTotal(quantity, unitPrice);
      
      if (total>=450){
        print('Total: PHP ${total.toStringAsFixed(2)} - Big purchase!');
      } else if (total>=200){
        print('Total: PHP ${total.toStringAsFixed(2)} - Nice purchase.');
      } else {
        print('Total: PHP ${total.toStringAsFixed(2)} - Small purchase.');
      }
    } on FormatException {
      print('Error: "$input" is not a valid number. Skipping order.');
    } on ArgumentError catch (e){
      print('Error: ${e.message} Skipping order.');
    } finally {
      print('Order ${i+1} checked.');
    }
  }
  
  print('All orders processed. The program did not crash.');
  
}
