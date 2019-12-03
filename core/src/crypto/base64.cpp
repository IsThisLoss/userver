#include <crypto/base64.hpp>

#include <cryptopp/base64.h>

#include <crypto/exception.hpp>

#ifdef CRYPTOPP_NO_GLOBAL_BYTE
using CryptoPP::byte;
#endif

namespace crypto::base64 {

namespace {

template <typename Base64Encoder>
std::string Base64Encode(utils::string_view data, Pad pad) {
  std::string response;
  try {
    Base64Encoder encoder(new CryptoPP::StringSink(response));
    CryptoPP::AlgorithmParameters params =
        CryptoPP::MakeParameters(CryptoPP::Name::Pad(), Pad::kWith == pad)(
            CryptoPP::Name::InsertLineBreaks(), false);
    encoder.IsolatedInitialize(params);
    encoder.PutMessageEnd(reinterpret_cast<const byte*>(data.data()),
                          data.size());
  } catch (const CryptoPP::Exception& exc) {
    throw crypto::CryptoException(exc.what());
  }
  return response;
}

template <typename Base64Decoder>
std::string Base64Decode(utils::string_view data) {
  std::string response;
  try {
    Base64Decoder decoder(new CryptoPP::StringSink(response));
    decoder.PutMessageEnd(reinterpret_cast<const byte*>(data.data()),
                          data.size());
  } catch (const CryptoPP::Exception& exc) {
    throw crypto::CryptoException(exc.what());
  }
  return response;
}

}  // namespace

std::string Base64Encode(utils::string_view data, Pad pad) {
  return Base64Encode<CryptoPP::Base64Encoder>(data, pad);
}

std::string Base64Decode(utils::string_view data) {
  return Base64Decode<CryptoPP::Base64Decoder>(data);
}

std::string Base64UrlEncode(utils::string_view data, Pad pad) {
  return Base64Encode<CryptoPP::Base64URLEncoder>(data, pad);
}

std::string Base64UrlDecode(utils::string_view data) {
  return Base64Decode<CryptoPP::Base64URLDecoder>(data);
}

}  // namespace crypto::base64
