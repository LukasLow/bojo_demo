/* cprint — the C half of the cprint package.
 *
 * Shipped as source. The consumer compiles it during its own build, so the
 * binary always matches the host (no prebuilt .so in the repository).
 */

#include <stdio.h>

void cprint_banner(void) {
    printf("+--------------------------------------+\n");
    printf("|  cprint: this line came from C       |\n");
    printf("+--------------------------------------+\n");
}

void cprint_rule(int width) {
    for (int i = 0; i < width; i++) {
        putchar('-');
    }
    putchar('\n');
}

void cprint_text(const char *label, const char *value) {
    printf("%s = %s\n", label, value);
}
