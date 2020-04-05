<h1 align="center">Website Mirror</h1>

![Preview_image](https://repository-images.githubusercontent.com/247682655/4f5b3700-67de-11ea-96d3-55bce539c6d1)

A handy action to download the website from a given URL and push it to a new github repo using given credentials.

It will convert the urls to locally downloaded resources and keep the log in an external file `download.log`.

### Mirror Website Configuration

Use the below code and make sure to add the required details in the workflow \| account.

```yaml
name: Website Mirror
on: 
  issues:
    types: [opened]
jobs:
    build:
        name: Setup Environment for Mirroring
        runs-on: ubuntu-latest
        steps:
             - uses: actions/checkout@v1
             - uses: ./
               env:
                  URL: ${{ secrets.MIRROR_URL }}
                  _GITHUB_TOKEN: ${{ secrets._GITHUB_TOKEN }}
                  USER_NAME: ${{ secrets.GITHUB_USER }}
                  USER_EMAIL: ${{ secrets.GITHUB_USER_EMAIL }}
```

### Configuration Variables

| name | secret_reference | type | required | description |
| ---- | ---------------- | ----- | ------- | ----------- |
|  _GITHUB_TOKEN | `${{ secrets._GITHUB_TOKEN }}` | string | Y | Token to access github account|
| URL | `${{ secrets.MIRROR_URL }}` | string | Y | HostName of the website |
| USER_NAME | `${{ secrets.GITHUB_USER }}` | string | Y | Github usernam |
| USER_EMAIL | `${{ secrets.GITHUB_USER_EMAIL }}` | string | Y | Github email |


### Usage
1. Fork Project
2. Configure the required parameters
3. Commit your changes
4. Create an issue to initiate mirroring

### License

```
MIT License

Copyright (c) 2020 Pavneet Singh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```