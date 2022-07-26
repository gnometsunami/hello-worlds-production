/**
 * The HelloWorld class implements an application that
 * simply prints "Hello World" to standard output.
 */

package helloworld;

final class HelloWorld {
    private HelloWorld() {
        throw new AssertionError("HelloWorld is a utility class.");
    }
    public static void main(final String[] args) {
        System.out.println("Hello World");
    }
}
