local Expectation = require("spec.Expectation")

function expect(...)
	return Expectation.new(...)
end
