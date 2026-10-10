/*
 * modify.h
 * Modify a value in the savefile
 * By J. Stuart McMurray
 * Created 20250428
 * Last Modified 20261010
 */

#ifndef HAVE_MODIFY_H
#define HAVE_MODIFY_H 1

/* modify modifies buf according to mod, which should be of the form 0xoff=val,
 * where val is either true, false, or a float. */
void modify(char *buf, size_t len, const char *mod);

#endif /* #ifndef HAVE_MODIFY_H */
