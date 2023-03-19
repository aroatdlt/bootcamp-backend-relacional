

using BookManager.Application.Models;
using BookManager.FunctionalTests.TestSupport;
using System.Net.Http.Json;
using System.Text.Json;
using FluentAssertions;
using Microsoft.VisualStudio.TestPlatform.CommunicationUtilities;

namespace BookManager.FunctionalTests;

public class BookTests: IntegrationTest
{
    [Fact]
  public async Task Given_Post_Book_Endpoint_When_Sending_BookId_It_Returns_Book()
    {
        //Given
        //Step 1 send an book 

        var bookPayload = new Book()
        {
            authorId = 1,
            description = "book",
            publishedOn = new DateTime(2021, 07, 20), 
            title = "hola"    
        };

        var addBook = await HttpClient.PostAsJsonAsync($"api/bookmanager/books", bookPayload);
   
        if (!addBook.IsSuccessStatusCode)
        {
            throw new Exception("Could not add new Book. Test cannot continue");
        }
 

        //When
        var result = await HttpClient.GetAsync($"api/bookmanager/books");


        //Then
        var json = await result.Content.ReadAsStringAsync();
        var serializerOptions = new JsonSerializerOptions(JsonSerializerDefaults.Web);
        var books = (JsonSerializer.Deserialize<IEnumerable<Book>>(json, serializerOptions)
                       ?? Array.Empty<Book>()).ToList();
        var insertedBook = books.Find(q => q.title == bookPayload.title);

        insertedBook.Should().NotBeNull();

    }
}

