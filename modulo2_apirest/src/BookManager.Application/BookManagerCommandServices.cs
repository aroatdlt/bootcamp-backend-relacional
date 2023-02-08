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

    public async Task SendBook(int id, Book data)
    {
        var bookEntity =
            new BookEntity
            {   
                AuthorId = data.authorId,
                Title = data.title,
                Description = data.description,
                PublishedOn = Convert.ToDateTime(data.publishedOn),
            };

        _bookManagerDbContext.Books.Add(bookEntity);

        await _bookManagerDbContext.SaveChangesAsync();
    }
}

