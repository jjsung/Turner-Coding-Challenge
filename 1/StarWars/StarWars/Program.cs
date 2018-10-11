using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

/* Parameters- tested: 1."Return of the Jedi" starships name 
 *					   2."Return of the Jedi" starships cargo_capacity
 *					   3. "A New Hope" characters name
 *					   4. "A New Hope" characters eye_color
 *					   
 * Note: if you want to debug, you can pass the command line arguments in Project(StarWars)-->Property-->Debug-->command line arguments window
 */
namespace StarWars
{
	class Program
	{
		private const string apiUrl = "https://swapi.co/api/films/?search=";
		private static string title;
		private static string pName;
		private static string subPName;
		private static HashSet<string> hs;

		static void Main(string[] args)
		{
			try {
				if (args == null) {
					Console.WriteLine("No parameters passed");
				}
				else {
					//Stopwatch sw = new Stopwatch();
					//sw.Start();
					hs = new HashSet<string>();
					title = args[0];
					pName = args[1];
					subPName = args[2];
					SearchSwapi().Wait();
					//sw.Stop();
					//Console.WriteLine(sw.Elapsed);
					//Refresh();
				}
			}
			catch(Exception ex) {
				Console.WriteLine("Exception at Main(): {0}", ex.ToString());
			}
		}

		static async Task SearchSwapi()
		{
			string page = apiUrl + title;
			string result = "";
			List<string> finalResult = new List<string>(20);
			try {
				// HttpClient setup
				using (HttpClient client = new HttpClient())
				using (HttpResponseMessage response = await client.GetAsync(page))
				using (HttpContent content = response.Content)
				{
					// Read the string.
					result = await content.ReadAsStringAsync();
				}
				JObject jsonParsed = JObject.Parse(result);
				var uris = jsonParsed["results"][0][pName].Select(x => x.ToString());
				List<Task> target = new List<Task>();
				// Add tasks and run in parallel
				foreach (string uri in uris) {
					target.Add(SubSearch(uri));
				}
				await Task.WhenAll(target);
			}
			catch (HttpRequestException ex) {
				Console.WriteLine("HttpRequestException at SearchSwapi(): {0}", ex.ToString());
			}
			catch (Exception ex) {
				Console.WriteLine("Exception at SearchSwapi(): {0}", ex.ToString());
			}
		}
		static async Task SubSearch(string uri) {
			string result = "";
			try {
				// HttpClient setup
				using (HttpClient client = new HttpClient())
				using (HttpResponseMessage response = await client.GetAsync(uri))
				using (HttpContent content = response.Content) {
					// Read the string.
					result = await content.ReadAsStringAsync();
				}
				JObject jsonParsed = JObject.Parse(result);
				result = (string)jsonParsed[subPName];
				// Making sure no duplicates are printed
				if (!hs.Contains(result)) {
					hs.Add(result);
					Console.WriteLine(result);
				}
			}
			catch (HttpRequestException ex) {
				Console.WriteLine("HttpRequestException at SubSearch(): {0}", ex.ToString());
			}
			catch (Exception ex) {
				Console.WriteLine("Exception at SubSearch(): {0}", ex.ToString());
			}
		}
	}
}
