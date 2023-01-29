using Microsoft.EntityFrameworkCore;
using BookManager.Domain;

namespace BookManager.Application
{
    public interface IBookManagerDbContext
    {
        DbSet<AuthorEntity> Authors { get; }
        DbSet<BookEntity> Books { get; }
        Task<int> SaveChangesAsync();
    }
}






