#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/components
cat > src/components/BuyButton.tsx <<'TSX'
import React from 'react';

type Props = { sku: string; onBuy: (sku: string) => void; disabled?: boolean };

export function BuyButton({ sku, onBuy, disabled = false }: Props) {
  return (
    <button className="btn btn-primary" disabled={disabled} onClick={() => onBuy(sku)}>
      Comprar
    </button>
  );
}
TSX
