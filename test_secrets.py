
def main():
    with open(".secrets.toml", "r") as toml_file:
        for line in toml_file:
            print(line)


if __name__ == "__main__":
    main()
