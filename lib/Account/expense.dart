class Expense{
  String title;
  ExpenseCategory category;
  String description = "";
  double nominal;

  Expense(this.title, this.category, this.nominal);
}

class ExpenseCategory{
  String title;
  int id;
  List<Expense> expenses = [];
  double total = 0;

  ExpenseCategory(this.title, this.id);

  void totalExpenses(Expense x){
    int length = expenses.length;

    for (int i = 0; i < length; i++){
      total += expenses[i].nominal;
    } 
  }
}