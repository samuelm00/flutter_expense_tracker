namespace ExpenseTrackerApi;

public class TransactionDTO
{
    public string id;

    public string title;

    public double amount; 

    public DateTime date;

    TransactionDTO(string id, string title, double amount, DateTime date)
    {
        this.id = id;
        this.title = title;
        this.amount = amount;
        this.date = date;
    }
}
