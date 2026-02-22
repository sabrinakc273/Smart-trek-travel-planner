export type ClassValue = string | number | boolean | null | undefined | ClassDictionary | ClassArray;
interface ClassDictionary { [id: string]: any; }
interface ClassArray extends Array<ClassValue> {}

export function cn(...inputs: ClassValue[]): string {
  const out: string[] = [];

  const flatten = (val: ClassValue) => {
    if (val === null || val === undefined || val === false) return;
    if (typeof val === 'string' || typeof val === 'number') {
      out.push(String(val));
      return;
    }
    if (Array.isArray(val)) {
      val.forEach(flatten);
      return;
    }
    if (typeof val === 'object') {
      for (const k in val as ClassDictionary) {
        if ((val as ClassDictionary)[k]) out.push(k);
      }
    }
  };

  inputs.forEach(flatten);
  return out.join(' ').trim();
}

export default cn;