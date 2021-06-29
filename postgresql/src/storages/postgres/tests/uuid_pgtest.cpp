#include <storages/postgres/io/uuid.hpp>

#include <boost/uuid/random_generator.hpp>
#include <boost/uuid/uuid_io.hpp>

#include <storages/postgres/parameter_store.hpp>
#include <storages/postgres/tests/test_buffers.hpp>
#include <storages/postgres/tests/util_pgtest.hpp>

namespace {

namespace pg = storages::postgres;

UTEST_P(PostgreConnection, UuidRoundtrip) {
  ASSERT_TRUE(conn.get()) << "Expected non-empty connection pointer";
  boost::uuids::uuid expected = boost::uuids::random_generator{}();
  ASSERT_FALSE(expected.is_nil());

  pg::ResultSet res{nullptr};
  EXPECT_NO_THROW(res = conn->Execute("select $1, $1::text", expected));

  boost::uuids::uuid received;
  std::string string_rep;
  EXPECT_NO_THROW(res[0].To(received, string_rep));
  EXPECT_EQ(expected, received);
  EXPECT_EQ(to_string(expected), string_rep);
}

UTEST_P(PostgreConnection, UuidStored) {
  ASSERT_TRUE(conn.get()) << "Expected non-empty connection pointer";
  boost::uuids::uuid expected = boost::uuids::random_generator{}();

  pg::ResultSet res{nullptr};
  EXPECT_NO_THROW(res = conn->Execute("select $1",
                                      pg::ParameterStore{}.PushBack(expected)));
  EXPECT_EQ(expected, res[0][0].As<boost::uuids::uuid>());
}

}  // namespace
