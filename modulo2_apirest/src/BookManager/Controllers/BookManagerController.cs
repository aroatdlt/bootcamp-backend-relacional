using Microsoft.AspNetCore.Mvc;
using BookManager.Application;
using BookManager.Application.Models;

namespace BookManager.Controllers;
[Route("api/[controller]")]
public class BookManagerController : ControllerBase
{
    private readonly BookManagerCommandServices _bookManagerCommandServices;

    public BookManagerController(BookManagerCommandServices bookManagerCommandServices)
    {
        _bookManagerCommandServices = bookManagerCommandServices;
    }

    [HttpPost("authors")]
    public async Task<IActionResult> SendAuthor(int id, [FromBody] Author data)
    {
        await _bookManagerCommandServices.SendAuthor(id, data);
        return Ok();
    }
}





    

    
    

   
