using Microsoft.EntityFrameworkCore;
using BookManager.Domain;
using BookManager.Application;

namespace BookManager.Persistence.SqlServer
{
    public class BookManagerDbContext
        : DbContext, IBookManagerDbContext
    {
        public BookManagerDbContext(DbContextOptions<BookManagerDbContext> options)
            : base(options)
        { }
        public DbSet<BookEntity> Books { get; set; } = null!;
        public DbSet<AuthorEntity> Authors { get; set; } = null!;
        public Task<int> SaveChangesAsync()
        {
            return base.SaveChangesAsync();
        }
    }
}