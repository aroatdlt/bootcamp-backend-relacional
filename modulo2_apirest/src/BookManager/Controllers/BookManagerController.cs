using Microsoft.AspNetCore.Mvc;
using BookManager.Application;
using BookManager.Application.Models;
using System.Net;

namespace BookManager.Controllers;
[Route("api/[controller]")]
public class BookManagerController : ControllerBase
{
    private readonly BookManagerCommandServices _bookManagerCommandServices;
    private readonly BookQueryService _bookQueryService;

    public BookManagerController(
        BookManagerCommandServices bookManagerCommandServices,
        BookQueryService bookQueryService)
    {
        _bookManagerCommandServices = bookManagerCommandServices;
        _bookQueryService = bookQueryService;
    }

    [HttpPost("authors")]
    public async Task<IActionResult> SendAuthor(int id, [FromBody] Author data)
    {
        await _bookManagerCommandServices.SendAuthor(id, data);
        return Ok();
    }

    [HttpPost("books")]
    public async Task<IActionResult> SendBook(int id, [FromBody] Book data)
    {
        await _bookManagerCommandServices.SendBook(id, data);
        return Ok();
    }

    [HttpPut("books/{id:int}")]
    public async Task<IActionResult> ModifyBook(int id, [FromBody] Book data)
    {
        await _bookQueryService.ModifyBook(id, data);
        return Ok(HttpStatusCode.NoContent);
    }
    [HttpGet("books")]
    public async Task<IEnumerable<Book>> GetBooks()
    {
        var books = await _bookQueryService.GetAllBooks();
        return books;
    }
}





    

    
    

   
