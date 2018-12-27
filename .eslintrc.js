module.exports = {
    "parserOptions": {
        "ecmaVersion": 2017,
        "sourceType": 'module'
    },
    "env": {
        "es6": true,
        "node": true
    },
    "extends": "eslint:recommended",
    "rules": {
        "indent": [
            "error",
            2
        ],
        "linebreak-style": [
            "error",
            "unix"
        ],
        "quotes": [
            "error",
            "single"
        ],
        "semi": [
            "error",
            "never"
        ],
        "no-console": [
            "off"
        ],
        "no-unused-vars": [
            "warn",
            {
                "args": "none"
            }
        ],
        "no-useless-escape": [
            "off"
        ],
        "key-spacing": [
            "warn"
        ]
    }
}