#include "listener.hpp"

#include <engine/async.hpp>
#include <logging/log.hpp>

namespace server {
namespace net {

Listener::Listener(std::shared_ptr<EndpointInfo> endpoint_info,
                   engine::TaskProcessor& task_processor,
                   request::ResponseDataAccounter& data_accounter)
    : task_processor_(&task_processor),
      endpoint_info_(std::move(endpoint_info)),
      data_accounter_(&data_accounter) {}

Listener::~Listener() {
  if (!impl_) return;

  LOG_TRACE() << "Destroying listener";
  impl_.reset();
  LOG_TRACE() << "Destroyed listener";
}

void Listener::Start() {
  impl_ = std::make_unique<ListenerImpl>(*task_processor_, endpoint_info_,
                                         *data_accounter_);
}

Stats Listener::GetStats() const {
  if (impl_) return impl_->GetStats();
  return Stats{};
}

}  // namespace net
}  // namespace server
