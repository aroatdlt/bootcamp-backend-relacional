using BookManager.Domain;
namespace BookManager.Application;
using BookManager.Application.Models;

public class BookManagerCommandServices
{
    private readonly IBookManagerDbContext _bookManagerDbContext;

    public BookManagerCommandServices(IBookManagerDbContext bookManagerDbContext)
    {
        _bookManagerDbContext = bookManagerDbContext;
    }

    public async Task SendAuthor(int id, Author data)
    {
        var authorEntity =
            new AuthorEntity
            {
                Name = data.name,
                LastName = data.lastName,
                Birth = Convert.ToDateTime(data.birth),
                CountryCode = data.countryCode
            };

        _bookManagerDbContext.Authors.Add(authorEntity);

        await _bookManagerDbContext.SaveChangesAsync();
    }

    public async Task SendBook(string title, string description, DateTime publishedOn, int authorId)
    {
        var bookEntity =
            new BookEntity
            {
                Title = title,
                Description = description,
                PublishedOn = Convert.ToDateTime(publishedOn),
                AuthorId = authorId
            };

        _bookManagerDbContext.Books.Add(bookEntity);

        await _bookManagerDbContext.SaveChangesAsync();
    }


    //public async Task<Guid> Create()
    //{
    //  var bookManagerEntity = new BookManagerEntity();
    //_bookManagerDbContext.Chats.Add(bookManagerEntity);

    //await _bookManagerDbContext.SaveChangesAsync();
    //return bookManagerEntity.Id;
    //}



}

