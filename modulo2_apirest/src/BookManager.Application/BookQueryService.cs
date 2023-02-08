using BookManager.Application.Models;
using BookManager.Domain;
using Microsoft.EntityFrameworkCore;
using System.Net;
using System.Reflection;

namespace BookManager.Application;
public class BookQueryService
 {
    private readonly IBookManagerDbContext _bookManagerDbContext;
    public BookQueryService(IBookManagerDbContext bookManagerDbContext)
    {
        _bookManagerDbContext = bookManagerDbContext;
    }

    public async Task ModifyBook(int bookId, Book data)
    {
       var bookEntity = 
           await _bookManagerDbContext
                .Books
                .Where(u => u.Id == bookId)
        .ToListAsync();

        var bookToModify = bookEntity.FirstOrDefault();

        if (bookToModify != null && data.title != null)
        {
            bookToModify.Title = data.title;
        }
        if (bookToModify != null && data.description != null)
        {
            bookToModify.Description = data.description;
        }
        await _bookManagerDbContext.SaveChangesAsync();
    }

    public async Task<IEnumerable<Book>> GetAllBooks()
    {
        var bookEntities =
           await _bookManagerDbContext
                .Books.Select(x => new Book()
                {
                    authorId= x.AuthorId,
                    description= x.Description,
                    title= x.Title,
                    publishedOn = x.PublishedOn,
                    id = x.Id
                })
            .ToListAsync();

        return bookEntities;
    }

 }

