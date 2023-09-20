FROM binwiederhier/ntfy
EXPOSE 80
ENTRYPOINT ["ntfy", "serve"]
