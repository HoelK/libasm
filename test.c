# include <stdio.h>
# include <string.h>
# include <stdlib.h>
# include "libasm.h"

# define DEFAULT	"\033[0m"
# define RED		"\033[31m"
# define GREEN		"\033[32m"

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
		NULL
	};

	for (int i  = 0; srcs[i]; i++)
	{
		char og_dst[20] = {0};
		char ft_dst[20] = {0};

		const char *og_res = strcpy(og_dst, srcs[i]);
		const char *ft_res = ft_strcpy(ft_dst, srcs[i]);
		STRCPY_RESULT(og_res, ft_res, srcs[i]);
	}
}

int	main(void)
{
	strlen_tests();
	strcpy_tests();

	return (EXIT_SUCCESS);
}
