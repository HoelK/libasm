# include <stdio.h>
# include <string.h>
# include <stdlib.h>
# include <stdbool.h>
# include "../header/libasm.h"

# define DEFAULT	"\033[0m"
# define RED		"\033[31m"
# define GREEN		"\033[32m"

bool	strcmp_sanitycheck(int r1, int r2) { return ((r1 < 0 && r2 >= 0) || (r1 > 0 && r2 <= 0) || (r1 == 0 && r2 != 0)); }

# define STRLEN_RESULT(str) \
	fprintf(stderr, "[STRLEN]"); \
	if (strlen(str) != ft_strlen(str)) { fprintf(stderr, RED"[KO]"DEFAULT); } \
	else { fprintf(stderr, GREEN"[OK]"DEFAULT); } \
	fprintf(stderr, "%s\n", str);

# define STRCPY_RESULT(og_res, my_res, test) \
	fprintf(stderr, "[STRCPY]"); \
	if (strcmp(og_res, my_res)) { fprintf(stderr, RED"[KO]"DEFAULT); } \
	else { fprintf(stderr, GREEN"[OK]"DEFAULT); } \
	fprintf(stderr, "%s\n", test);

# define STRCMP_RESULT(str1, str2) \
		fprintf(stderr, "[STRCMP]"); \
		if (strcmp_sanitycheck(strcmp(str1, str2), ft_strcmp(str1, str2))) { fprintf(stderr, RED"[KO]"DEFAULT); } \
		else { fprintf(stderr, GREEN"[OK]"DEFAULT); } \
		fprintf(stderr, "%s & %s\n", str1, str2);

void	strlen_tests()
{
	const char *srcs[] = {
		"",
		"a",
		"idle",
		"100 size                                                                                            ",
		NULL
	};

	for (int i = 0; srcs[i]; i++) { STRLEN_RESULT(srcs[i]); }
}

void	strcpy_tests()
{
	const char *srcs[] = {
		"",
		"a",
		"idle",
		"dst size = src size",
		"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
		NULL
	};

	for (int i  = 0; srcs[i]; i++)
	{
		char og_dst[400] = {0};
		char ft_dst[400] = {0};

		const char *og_res = strcpy(og_dst, srcs[i]);
		const char *ft_res = ft_strcpy(ft_dst, srcs[i]);
		STRCPY_RESULT(og_res, ft_res, srcs[i]);
	}
}

void	strcmp_tests()
{
	const char *(srcs[][2]) = {
		{ "", "" },
		{ "abc", "abc" },
		{ "abc", "" },
		{ "", "abc" },
		{ "abcd", "abc" },
		{ "abc", "abcd" },
		{ "a", "A" },
		{ "Hello", "Hello World" },
		{ "\xFF", "\x7F" },
		{ NULL, NULL }
	};

	for (int i = 0; srcs[i][0]; i++) { STRCMP_RESULT(srcs[i][0], srcs[i][1]); }
}

int	main(void)
{
	strlen_tests();
	strcpy_tests();
	strcmp_tests();

	return (EXIT_SUCCESS);
}
