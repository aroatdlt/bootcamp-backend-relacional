namespace BookManager.Application.Models
{
    public class Book
    {
        public int id { get; set; }
        public string title { get;  set; } = string.Empty;
        public DateTime? publishedOn { get; init; }
        public string description { get; set; } = string.Empty;
        public int authorId { get; init; }
    }
}
