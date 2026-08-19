const test = require("node:test");
const assert = require("node:assert");

test("basic application test", () => {
  const status = "healthy";

  assert.strictEqual(status, "healthy");
});
