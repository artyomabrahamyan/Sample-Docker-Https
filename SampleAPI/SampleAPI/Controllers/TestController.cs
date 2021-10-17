using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace SampleAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TestController : ControllerBase
    {
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var c = await Task.FromResult("Test works");
            return Ok(c);
        }
    }
}
