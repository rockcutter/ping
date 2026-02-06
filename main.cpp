#include "httplib.h"
#include "spdlog/spdlog.h"

int main() {
  httplib::Server svr;

  svr.Get("/ping", [](const httplib::Request&, httplib::Response& res) {
    spdlog::info("Received ping");
    res.set_content("pong", "text/plain");
  });

  spdlog::info("Starting server");
  svr.listen("0.0.0.0", 8080);
  return 0;
}
