# pragma once

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
int		ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

bool	ft_isdigit(char c);
bool	ft_isspace(char c);
bool	ft_isset(char c, const char *set);

int		ft_atoi_base(const char *s);
