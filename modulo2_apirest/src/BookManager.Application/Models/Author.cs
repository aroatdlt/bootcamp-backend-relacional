using System.Xml.Linq;

namespace BookManager.Application.Models
{
    public class Author
    {
        public int id { get; }
        public string name { get; init; } = string.Empty;
        public string lastName { get; init;  } = string.Empty;
        public DateTime? birth { get; init; }
        public string countryCode { get; init; } = string.Empty; 
    }
}


