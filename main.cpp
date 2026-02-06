#include "httplib.h"
#include "spdlog/spdlog.h"

int main() {
  httplib::Server svr;

  svr.Get("/ping", [](const httplib::Request& req, httplib::Response& res) {
    spdlog::info("Received ping");
    res.set_content("pong", "text/plain");
  });

  svr.listen("0.0.0.0", 8080);
  return 0;
}
