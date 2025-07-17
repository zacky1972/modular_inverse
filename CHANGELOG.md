# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-7-18

### Added
- **Core functionality**: `ModularInverse.of/2` function for calculating modular multiplicative inverses
- **Algorithm implementation**: Extended Euclidean Algorithm for efficient computation
- **Error handling**: Proper `RuntimeError` for cases where inverse doesn't exist
- **Type specifications**: Complete type specs for all functions
- **Comprehensive testing**: Randomized test suite with 10,000 test cases
- **Development tooling**: Credo, Dialyzer, and Spellweaver integration
- **Documentation**: Complete API documentation with examples and mathematical background
- **Project configuration**: Full mix.exs setup with dependencies and build aliases
- Comprehensive documentation with mathematical background
- Extended Euclidean Algorithm implementation
- Randomized testing with 10,000 test cases
- Type specifications for all functions
- Error handling for non-coprime numbers
- Project structure with development tooling
- Test coverage and validation

### Features
- **Modular Inverse Calculation**: Calculate the modular multiplicative inverse of any integer modulo another
- **Performance**: O(log min(a, m)) time complexity for efficient computation with large numbers
- **Mathematical Accuracy**: Handles edge cases and validates mathematical properties
- **Error Handling**: Clear error messages when inverse doesn't exist
- **Type Safety**: Complete type specifications for compile-time safety

### Technical Details
- **Algorithm**: Uses Extended Euclidean Algorithm for optimal performance
- **Normalization**: Returns smallest non-negative representative of the inverse
- **Validation**: Comprehensive test suite validates `(a * inverse) mod m = 1`
- **Dependencies**: Built on `BinaryExtendedGcd` for core algorithm
- **Tooling**: Integrated with modern Elixir development tools

### Documentation
- **Module Documentation**: Complete mathematical background and usage examples
- **Function Documentation**: Detailed parameter descriptions and return types
- **README**: Comprehensive guide with installation, usage, and applications
- **API Reference**: Complete function documentation with examples
- **Mathematical Background**: Clear explanation of modular multiplicative inverses

### Development
- **Code Quality**: Credo integration for code analysis
- **Type Checking**: Dialyzer integration for static analysis
- **Spell Checking**: Spellweaver integration for documentation quality
- **Testing**: Comprehensive randomized test suite
- **Build System**: Mix aliases for quality checks and documentation

---

## Version History

- **1.0.0**: First stable release with complete modular inverse functionality

## Contributing

When contributing to this project, please update the changelog by adding a new entry under the [Unreleased] section. Follow the existing format and include:

- **Added**: New features
- **Changed**: Changes in existing functionality
- **Deprecated**: Features that will be removed in upcoming releases
- **Removed**: Features that have been removed
- **Fixed**: Bug fixes
- **Security**: Vulnerability fixes

## Links

- [GitHub Repository](https://github.com/zacky1972/modular_inverse)
- [Documentation](https://hexdocs.pm/modular_inverse)
- [Hex Package](https://hex.pm/packages/modular_inverse)
