using Microsoft.AspNetCore.Mvc;

namespace ExpenseTrackerApi.Controllers;

[ApiController]
[Route("transactions")]
public class ExpenseTrackerApi : ControllerBase
{
    private static readonly string[] Summaries = new[]
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    private readonly ILogger<ExpenseTrackerApi> _logger;

    private List<TransactionDTO> _transactions = new List<TransactionDTO>();

    public ExpenseTrackerApi(ILogger<ExpenseTrackerApi> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public IEnumerable<TransactionDTO> GetTransactions()
    {
        return _transactions;
    }

    [HttpPost]
    public TransactionDTO AddTransaction(TransactionDTO transaction)
    {
        _transactions.Add(transaction);
        return transaction;
    }

    [HttpDelete]
    public IActionResult DeleteTransaction(string id)
    {
        _transactions.RemoveAll(t => t.Id == id);
        return Ok();
    }
}
