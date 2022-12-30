using Microsoft.EntityFrameworkCore;
using BookManager.Domain;

namespace BookManager.Persistence.SqlServer
{
    public class BookManagerDbContext
        : DbContext
    {
        public BookManagerDbContext(DbContextOptions<BookManagerDbContext> options)
            : base(options)
        { }
        public DbSet<BookEntity> Books { get; set; } = null!;
        public DbSet<AuthorEntity> Authors { get; set; } = null!;
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder
               .Entity<BookEntity>()
               .HasOne(m => m.Author)
               .WithMany(u => u.Books)
               .HasForeignKey(m => m.AuthorId);
        }

    }
}