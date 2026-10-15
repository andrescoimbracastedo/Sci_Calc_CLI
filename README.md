# Scientific Calculator CLI

A scientific calculator built in C, designed to evaluate mathematical expressions from the command line while respecting operator precedence (BEDMAS).

This project started as an exercise in strengthening my C programming skills. As the calculator grew more complex, I moved away from handling expressions through string comparisons and toward a tokenizer, a structured token representation, and a proper expression-evaluation pipeline.

## How It Works

The calculator processes an expression through several stages:

1. **Input processing:** Reads and validates the user's mathematical expression.
2. **Tokenization:** Converts the input string into tokens representing numbers, operators, functions, and other supported elements.
3. **Infix-to-postfix conversion:** Uses the shunting-yard algorithm to convert the expression into postfix notation while preserving operator precedence and associativity.
4. **Expression evaluation:** Evaluates the postfix expression using a stack, applying the appropriate mathematical operation to each operand.
5. **Error handling:** Uses error codes and state-based control flow to handle invalid input and evaluation failures.

## What I Learned

This project pushed me beyond basic C programming exercises and into designing a larger system with distinct responsibilities.

- **Tokenization and parsing:** Moving from string comparisons to a structured representation of mathematical expressions.
- **Stacks and queues:** Applying these data structures to expression conversion and evaluation.
- **Function pointers and dispatch tables:** Connecting tokens and operations to their corresponding handlers.
- **State machines and error handling:** Organizing program flow and handling failures.
- **C data modeling:** Using `struct`, `typedef`, and `union` to organize data and represent different token types.
- **Conditional compilation:** Using preprocessor directives to control which code is compiled.
- **Input edge cases:** Handling less obvious numeric inputs such as `.5` and `-4`, alongside the challenges of distinguishing unary and binary operators.
- **Low-level debugging:** Inspecting the generated assembly to better understand how the C implementation translates into machine-level instructions.

The implementation went through several iterations. I regularly revisited earlier design decisions, especially around input processing and data representation, as the limitations of my original approach became apparent.

## Design Decisions

Rather than trying to evaluate the expression directly from the input string, I separated the problem into tokenization, conversion, and evaluation. This made the processing stages easier to reason about and gave me a clearer way to handle operator precedence and different kinds of input.

Some mathematical formulas and implementation details required external research. My main focus was on integrating those operations into a reliable expression-processing engine and understanding how the underlying C implementation worked.

## Future Plans

This CLI calculator is the first stage of a larger project: adapting the math engine for a Raspberry Pi Pico 2 and eventually building a physical scientific calculator.

## Repository Structure

- `src/` — C source code for the calculator and expression-processing engine.
- `asm/` — Assembly output generated for exploration and learning.


