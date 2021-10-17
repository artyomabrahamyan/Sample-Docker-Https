using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Net.Http;
using System.Threading.Tasks;

namespace SampleCallerApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SampleCaller : ControllerBase
    {
        private readonly ILogger<SampleCaller> _logger;

        public SampleCaller(ILogger<SampleCaller> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var httpClient = new HttpClient();
            var result = await httpClient.GetAsync("https://sample.api:443");
            return Ok(result);
        }
    }
}
