const fs = require('fs');
test('Hola Mundo', () => {
    const html = fs.readFileSync('./index.html', 'utf8');
    expect(html).toMatch(/<title>Hola Mundo<\/title>/);
});
