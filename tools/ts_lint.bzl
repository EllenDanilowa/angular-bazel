load("@npm//eslint:index.bzl", _eslint_test = "eslint_test")

def ts_lint(name = None, args = [], **kwargs):
 srcs = native.glob(["**/*.js", "**/*.ts"])

 _eslint_test(
     name = "lint",
     data = srcs + [
         "//:.gitignore",
         "//:.eslintrc.json",
         "//:.prettierrc",
         "//src:tsconfig.json",
         "@npm//@typescript-eslint/parser",
         "@npm//@typescript-eslint/eslint-plugin",
         "@npm//@angular-eslint/eslint-plugin",
         "@npm//@angular-eslint/eslint-plugin-template",
         "@npm//@angular-eslint/template-parser",
         "@npm//@angular-eslint/schematics",
         "@npm//eslint-plugin-import",
         "@npm//eslint-plugin-prettier",
         "@npm//eslint-config-airbnb-base",
         "@npm//prettier",
     ],
     args = args + ["--ignore-path", "$(location //:.gitignore)"] +
            ["$(location " + x + ")" for x in srcs] + ["--fix"],
     tags = ["lint"]
 )
