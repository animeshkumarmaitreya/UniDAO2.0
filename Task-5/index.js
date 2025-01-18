import { create } from 'ipfs-http-client';
import fs from 'fs';

const ipfs = create('http://127.0.0.1:5001');

async function uploadFile(filePath) {
  try {
    const fileContent = fs.readFileSync(filePath);
    const { cid } = await ipfs.add({ content: fileContent });
    console.log('Uploaded file CID:', cid.toString());
  } catch (error) {
    console.error('Error uploading file:', error);
  }
}
const filePath = './package.json'; 
uploadFile(filePath);

// NOTE ipfs daemon running is nesecesary
